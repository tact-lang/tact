// Nested optionals inside separate nested structs
struct Bottom {
    num: Int?;
}

struct Middle {
    inner: Bottom?;
}

contract TestContract {
    m: Middle?;
    
    init() {
        self.m = Middle{ inner: null };
    }
}