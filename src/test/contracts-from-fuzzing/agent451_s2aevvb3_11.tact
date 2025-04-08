struct Note {
    message: String?;
}

struct NestedNotes {
    note: Note?;
    title: String?;
}

contract NotesContract {
    notes: NestedNotes;

    init() {
        self.notes = NestedNotes{
            note: null,
            title: null,
        };
    }
}