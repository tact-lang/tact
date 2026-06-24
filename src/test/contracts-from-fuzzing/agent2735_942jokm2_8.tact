struct Deep1{v:Int;}
struct Deep2{s:Deep1;}
struct Deep3{s:Deep2;}
struct Deep4{s:Deep3;}
struct Deep5{s:Deep4;}

contract DeeplyNested {
    x: Deep5;

    init() {
        self.x = Deep5{ s: Deep4{ s: Deep3{ s: Deep2{ s: Deep1{ v: 42 } } } } };
    }
}
