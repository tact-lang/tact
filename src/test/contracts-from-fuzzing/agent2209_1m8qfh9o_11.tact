struct Arr1 {
    a: Int;
    b: Bool;
}

struct Arr2 {
    one: Arr1;
    two: Arr1;
    three: Arr1;
}

contract TestContract {
    batch: Arr2;
    init() {
        self.batch = Arr2{
            one: Arr1{a:1,b:true},
            two: Arr1{a:2,b:false},
            three: Arr1{a:3,b:true}
        };
    }
}