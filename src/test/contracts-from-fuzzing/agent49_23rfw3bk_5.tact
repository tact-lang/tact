struct Deep5 { v: Int; }
struct Deep4 { d5: Deep5; }
struct Deep3 { d4: Deep4; }
struct Deep2 { d3: Deep3; }
struct Deep1 { d2: Deep2; }

contract TestNested {
    receive() {
         let d5: Deep5 = Deep5{ v: 42 };
         let d4: Deep4 = Deep4{ d5: d5 };
         let d3: Deep3 = Deep3{ d4: d4 };
         let d2: Deep2 = Deep2{ d3: d3 };
         let d1: Deep1 = Deep1{ d2: d2 };
         d1.d2.d3.d4.d5.v;
    }
}
