struct Arr1 {
    a: Int;
    b: Bool;
}

struct Arr2 {
    a1: Arr1;
    a2: Arr1;
    a3: Arr1;
}

contract TestContract {
    s: Arr2;

    init() {
        self.s = Arr2{
            a1: Arr1{a:1, b:true},
            a2: Arr1{a:2, b:false},
            a3: Arr1{a:3, b:true}
        };
    }
}