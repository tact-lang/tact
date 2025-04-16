struct VeryDeep1 {
    inner: VeryDeep2;
}
struct VeryDeep2 {
    inner: VeryDeep3;
}
struct VeryDeep3 {
    inner: VeryDeep4;
}
struct VeryDeep4 {
    inner: VeryDeep5;
}
struct VeryDeep5 {
    leaf: Int;
}

contract Deepest {
    stored: VeryDeep1;

    init() {
        self.stored = VeryDeep1{
            inner: VeryDeep2{
                inner: VeryDeep3{
                    inner: VeryDeep4{
                        inner: VeryDeep5{
                            leaf: 777
                        }
                    }
                }
            }
        };
    }
}