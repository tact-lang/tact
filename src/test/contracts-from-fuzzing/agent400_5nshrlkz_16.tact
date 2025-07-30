struct Bottom {
    x: Int;
}

struct Mid {
    bottom: Bottom;
}

struct Top {
    mid: Mid;
}

contract TestAssignNested {
    storage: Top;
    init() {
        self.storage = Top {
            mid: Mid {
                bottom: Bottom {
                    x: 10
                }
            }
        };
    }
    receive() {
       let _ = self.storage.mid.bottom.x;
    }
}