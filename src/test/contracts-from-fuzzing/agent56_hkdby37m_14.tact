struct Arr1 { a1: Int; }
struct Arr2 { a2: Int; }
struct Arr3 { a3: Int; }
struct Arr4 { a4: Int; }
struct Arr5 { a5: Int; }

contract ManyStructs {
    aa1: Arr1;
    aa2: Arr2;
    aa3: Arr3;
    aa4: Arr4;
    aa5: Arr5;

    init() {
        self.aa1 = Arr1{a1:1};
        self.aa2 = Arr2{a2:2};
        self.aa3 = Arr3{a3:3};
        self.aa4 = Arr4{a4:4};
        self.aa5 = Arr5{a5:5};
    }
}