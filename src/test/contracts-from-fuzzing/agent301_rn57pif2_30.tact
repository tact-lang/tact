struct Small {
    x: Int?;
    y: Bool;
}

struct Mid {
    inner: Small?;
}

struct Large {
    innerMid: Mid?;
}

contract TestContract {
    data: Large;

    init() {
        self.data = Large{
            innerMid: Mid{
                inner: Small{
                    x: null,
                    y: true
                }
            }
        };
    }

    receive() {
        let _ = self.data.innerMid;
    }
}