struct HasStrings {
    note1: String;
    note2: String;
    note3: String;
    note4: String;
}

contract TestContract {
    text: HasStrings = HasStrings{
        note1:"a", note2:"b", note3:"c", note4:"d"
    };
}