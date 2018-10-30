/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import database.NoteDB;
import database.NotesDBException;
import java.util.Date;
import java.util.List;
import model.Note;

/**
 *
 * @author 747787
 */
public class NoteService {
    private NoteDB noteDB;
    public NoteService(){
        noteDB = new NoteDB();
    }
    public Note get(int noteId) throws NotesDBException{
        return noteDB.getNote(noteId);
    }
    public List<Note> getAll() throws NotesDBException{
        return noteDB.getAll();
    }
    public int update(int noteId, String contents) throws NotesDBException{
        Note note = get(noteId);
        note.setContents(contents);
        return noteDB.update(note);
    }
    public int delete(int noteId) throws NotesDBException{
        Note deleteNote;
        deleteNote = noteDB.getNote(noteId);
        return noteDB.delete(deleteNote);
    }
    public int insert(String contents) throws NotesDBException{
        Date date = new Date();
        
        Note note = new Note(0,date,contents);
        
        return noteDB.insert(note);
    }
}
