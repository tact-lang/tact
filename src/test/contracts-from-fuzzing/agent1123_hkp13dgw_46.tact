struct Joint {
    x: Int;
    y: Int;
}

contract OptsInStructs {
    innerOpt: Joint?;
    regular: Joint;

    init() {
        self.innerOpt = null;
        self.regular = Joint{x:5,y:10};
    }
}