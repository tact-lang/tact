struct BigNest1 {
    inner: BigNest2;
}

struct BigNest2 {
    inner: BigNest3;
}

struct BigNest3 {
    inner: BigNest4;
}

struct BigNest4 {
    comment: String;
}

contract TestContract {
    data: BigNest1;

    init() {
        self.data = BigNest1{
            inner: BigNest2{
                inner: BigNest3{
                    inner: BigNest4{
                        comment: "Very deep"
                    }
                }
            }
        };
    }
}
