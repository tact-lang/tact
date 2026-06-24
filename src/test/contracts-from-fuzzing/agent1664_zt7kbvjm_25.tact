message(1) Level1 {
    val: Int;
}

message(2) Level2 {
    inner: Level1;
}

contract PersistNestedMessages {
    saved: Level2;

    init() {
        self.saved = Level2{
            inner: Level1{ val: 42 }
        };
    }
}