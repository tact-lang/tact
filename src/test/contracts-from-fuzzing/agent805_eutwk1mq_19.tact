struct Leaf {
    cellData: Cell;
    note: String?;
}

struct Middle {
    child: Leaf?;
}

struct Top {
    mid: Middle;
}

contract TestContract {
    info: Top;

    init() {
        self.info = Top{
            mid: Middle{
                child: null
            }
        };
    }
}