// testing complex chain of nested structs with many optionals and string fields
struct Info {
    title: String;
    subtitle: String?;
    description: String?;
}

struct Wrap1 {
    info: Info;
}

struct Wrap2 {
    w1: Wrap1;
    note: String?;
}

contract NestedComplex {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            w1: Wrap1{
                info: Info{
                    title:"X",
                    subtitle:null,
                    description:null
                }
            },
            note:null
        };
    }
}
