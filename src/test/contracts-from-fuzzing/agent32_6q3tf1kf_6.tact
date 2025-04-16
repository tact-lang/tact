struct L10 {
    v: Int;
}

struct L9 {
    next: L10;
    v: Int;
}

struct L8 {
    next: L9;
    v: Int;
}

struct L7 {
    next: L8;
    v: Int;
}

struct L6 {
    next: L7;
    v: Int;
}

struct L5 {
    next: L6;
    v: Int;
}

struct L4 {
    next: L5;
    v: Int;
}

struct L3 {
    next: L4;
    v: Int;
}

struct L2 {
    next: L3;
    v: Int;
}

struct L1 {
    next: L2;
    v: Int;
}

contract TestVeryDeepNested {
    receive() {
         let chain: L1 = L1{
             v: 1,
             next: L2{
                 v: 2,
                 next: L3{
                     v: 3,
                     next: L4{
                         v: 4,
                         next: L5{
                             v: 5,
                             next: L6{
                                 v: 6,
                                 next: L7{
                                     v: 7,
                                     next: L8{
                                         v: 8,
                                         next: L9{
                                             v: 9,
                                             next: L10{ v: 10 }
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
             }
         };
         let sum: Int = chain.v + chain.next.v + chain.next.next.v + chain.next.next.next.v + chain.next.next.next.next.v + chain.next.next.next.next.next.v + chain.next.next.next.next.next.next.v + chain.next.next.next.next.next.next.next.v + chain.next.next.next.next.next.next.next.next.v + chain.next.next.next.next.next.next.next.next.next.v;
         sum;
    }
}
