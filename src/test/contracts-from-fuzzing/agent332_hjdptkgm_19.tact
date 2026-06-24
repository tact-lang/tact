struct Deep1 {
    level2: Deep2;
}
struct Deep2 {
    level3: Deep3;
}
struct Deep3 {
    level4: Deep4;
}
struct Deep4 {
    level5: Deep5;
}
struct Deep5 {
    value: Int;
}

contract TestContract {
    data: Deep1;

    init() {
        self.data = Deep1{
            level2: Deep2{
                level3: Deep3{
                    level4: Deep4{
                        level5: Deep5{
                            value: 123
                        }
                    }
                }
            }
        };
    }
}