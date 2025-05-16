struct OuterOpt {
    val: InnerOpt?;
}
struct InnerOpt {
    inners: DeeperOpt?;
}
struct DeeperOpt {
    a: Int;
}
contract Test {
    oo: OuterOpt;
    init() {
        self.oo = OuterOpt{ val: null };
    }
    receive(){ let _=self.oo.val; }
}