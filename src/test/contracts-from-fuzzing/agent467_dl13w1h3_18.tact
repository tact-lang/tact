// Deep nested optionals inside struct containing nested struct
struct InnerMost {
    flag: Bool?;
}

struct Middle {
    child: InnerMost?;
}

struct OuterMost {
    child: Middle?;
}

contract DeepOptStructs {
    val: OuterMost;

    init() {
        self.val = OuterMost{child:null};
    }
}
