struct Deep2 {
    a: Deep3;
}

struct Deep3 {
    b: Deep4;
}

struct Deep4 {
    c: Int;
}

contract DeepStorage2 {
    val: Deep2;

    init() {
        self.val = Deep2{
            a: Deep3{
                b: Deep4{
                    c: 100
                }
            }
        };
    }
}
