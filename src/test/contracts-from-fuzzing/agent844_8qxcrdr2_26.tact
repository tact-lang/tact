struct Recursive1 {
    r2: Recursive2?;
}

struct Recursive2 {
    val: Int;
}

contract RecursiveRefOpt {
    r: Recursive1;

    init() {
        self.r = Recursive1{
            r2: Recursive2{ val: 11 },
        };
    }

    receive() {
        let _ = self.r;
    }
}
