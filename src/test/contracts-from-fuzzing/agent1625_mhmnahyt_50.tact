struct RecursiveLevel1 {
    child: RecursiveLevel2?;
}

struct RecursiveLevel2 {
    child: RecursiveLevel3?;
}

struct RecursiveLevel3 {
    value: Int;
}

contract RecursiveNestedNulls {
    s: RecursiveLevel1;

    init() {
        self.s = RecursiveLevel1{
            child: null,
        };
    }
}
