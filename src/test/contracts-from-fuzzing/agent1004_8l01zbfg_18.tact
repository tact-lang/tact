// some deeply nested structs with many bools to test packing and bit layout
struct Layer3 {
    f1: Bool;
    f2: Bool;
    f3: Bool;
}

struct Layer2 {
    l3a: Layer3;
    l3b: Layer3;
}

struct Layer1 {
    l2: Layer2;
    flag: Bool;
}

contract TestContract {
    field: Layer1;
    init() {
        self.field = Layer1{
            l2: Layer2{
                l3a: Layer3{ f1:true, f2:false, f3:true },
                l3b: Layer3{ f1:false, f2:true, f3:false }
            },
            flag: true
        };
    }
}