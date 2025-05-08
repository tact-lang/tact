struct A1 {f1: Int;}
struct A2 {f2: A1;}
struct A3 {f3: A2;}
struct A4 {f4: A3;}
struct A5 {f5: A4;}
struct A6 {f6: A5;}

contract Chain {
    data: A6;

    init() {
        self.data = A6{f6: A5{f5: A4{f4: A3{f3: A2{f2: A1{f1: 42}}}}}};
    }
}