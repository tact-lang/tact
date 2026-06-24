struct Inner1 { x: Int; y: Bool }
struct Inner2 { data: String; flag: Bool }
struct Inner3 { value: Int?; text: String? }

struct Mid1 { a: Inner1; b: Inner2 }
struct Mid2 { c: Inner3; d: Bool }

struct Top {
    m1: Mid1;
    m2: Mid2;
    label: String;
    opt: Int?;
}

contract NestedManyLevels {
    all: Top;

    init() {
        self.all = Top{
            m1: Mid1{
                a: Inner1{ x:1, y:true },
                b: Inner2{ data:"txt", flag:false }
            },
            m2: Mid2{
                c: Inner3{ value:null, text:null },
                d:true
            },
            label:"Test",
            opt:null
        };
    }
    receive() {
        self.all = self.all;
    }
}