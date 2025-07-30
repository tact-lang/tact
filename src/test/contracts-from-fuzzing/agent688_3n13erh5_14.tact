struct S1 {
    x: Int = 0;
    y: String = "";
}

struct S2 {
    s1a: S1;
    s1b: S1;
    flag: Bool = false;
}

contract TestContract {
    val: S2;

    init() {
        self.val = S2{
            s1a: S1{x:1,y:"x"},
            s1b: S1{x:2,y:"y"},
            flag: true,
        };
    }
}