struct Reordered {
    b: Bool;
    i: Int;
    s: String;
}

contract TestContract {
    r: Reordered;

    init() {
        self.r = Reordered{ b:true, i:5, s:"x" };
    }

    receive() {
        self.r = Reordered{ b:false, i:6, s:"y" };
    }
}