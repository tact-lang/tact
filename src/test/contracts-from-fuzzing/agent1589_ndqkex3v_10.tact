struct RecursiveLevel3 {
    z: Int;
}

struct RecursiveLevel2 {
    mid: RecursiveLevel3;
}

struct RecursiveLevel1 {
    inner: RecursiveLevel2;
}

contract DeepRecursive {
    val: RecursiveLevel1;

    init() {
        self.val = RecursiveLevel1 {
            inner: RecursiveLevel2 {
                mid: RecursiveLevel3 {
                    z: 55,
                },
            },
        };
    }
}