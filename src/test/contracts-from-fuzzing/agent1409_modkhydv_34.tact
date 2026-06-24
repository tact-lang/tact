trait T { t: Int }
trait U { u: Bool }

contract Test with T, U {
    t: Int;
    u: Bool;
    init() {
        self.t = 4;
        self.u = false;
    }
    receive(){ let _=self.t; }
}