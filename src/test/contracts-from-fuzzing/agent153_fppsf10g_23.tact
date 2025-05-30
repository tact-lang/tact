struct List {
    item1: Int;
    item2: Int;
    item3: Int;
    item4: Int;
    item5: Int;
}

struct Wrap1 {
    list: List;
}
struct Wrap2 {
    wrap1: Wrap1;
}
struct Wrap3 {
    wrap2: Wrap2;
}
struct Wrap4 {
    wrap3: Wrap3;
}

contract MultipleWraps {
    root: Wrap4;

    init() {
        self.root = Wrap4{
            wrap3: Wrap3{
                wrap2: Wrap2{
                    wrap1: Wrap1{
                        list: List{
                            item1: 1,
                            item2: 2,
                            item3: 3,
                            item4: 4,
                            item5: 5
                        }
                    }
                }
            }
        };
    }

    receive() {}
}