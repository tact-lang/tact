struct Nest1 { v: Int; }
struct Nest2 { inner: Nest1; }
struct Nest3 { inner: Nest2; }
struct Nest4 { inner: Nest3; }
struct Nest5 { inner: Nest4; }

contract Deep5Contract {
    d: Nest5 = Nest5{inner:Nest4{inner:Nest3{inner:Nest2{inner:Nest1{v:42}}}}};
}