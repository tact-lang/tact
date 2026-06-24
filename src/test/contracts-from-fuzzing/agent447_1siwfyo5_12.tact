struct Deep1 { a: Int; }
struct Deep2 { b: Deep1; }
struct Deep3 { c: Deep2; }
struct Deep4 { d: Deep3; }
struct Deep5 { e: Deep4; }

contract DeepChain {
    chain: Deep5;
    
    init() {
        self.chain = Deep5{ e: Deep4{ d: Deep3{ c: Deep2{ b: Deep1{ a:42 }}}}};
    }
}