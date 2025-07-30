// Reordered nested fields to check serialization order sensitivity
struct X {
    a: Int;
    b: Bool;
    c: String;
}

struct Y {
    text: String;
    flag: Bool;
    nest: X;
}

contract OrderTest {
    data: Y = Y{
        text: "hi",
        flag: true,
        nest: X{a:1, b:false, c:"no"}
    };

    init() {
        self.data = Y{
            text: "changed",
            flag: false,
            nest: X{a:5, b:true, c:"yes"}
        };
    }
}