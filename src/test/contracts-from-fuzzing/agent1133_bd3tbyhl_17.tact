struct DoublyNested {
    a: Bool;
    b: String?;
}

struct Wrapper {
    inside: DoublyNested;
    num: Int;
}

contract FieldOrder {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            inside: DoublyNested{a:false, b:null},
            num:42
        };
    }
}