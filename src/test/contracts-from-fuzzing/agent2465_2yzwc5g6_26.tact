// Contract field with optional struct
struct BigStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract TestContract {
    maybeBig: BigStruct?;

    init() {
        self.maybeBig = null;
    }
}