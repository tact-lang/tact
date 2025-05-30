// Nested struct with long string list
struct Lvl2 {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

struct Lvl1 {
    lvl2: Lvl2;
    label: String;
}

contract NestedStrings {
    st: Lvl1;
    init() {
        self.st = Lvl1{
            lvl2: Lvl2{
                s1:"1", s2:"2", s3:"3", s4:"4", s5:"5"
            },
            label: "label"
        };
    }
}