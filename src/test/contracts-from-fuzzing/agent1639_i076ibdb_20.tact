struct SliceHolder {
    s1: Slice?;
    s2: Slice?;
    s3: Slice?;
}

struct Container {
    sh1: SliceHolder?;
    sh2: SliceHolder;
    sh3: SliceHolder?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            sh1: null,
            sh2: SliceHolder{
                s1: emptyCell().asSlice(),
                s2: null,
                s3: "abc".asComment().asSlice()
            },
            sh3: SliceHolder{
                s1: null,
                s2: null,
                s3: null
            }
        };
    }
}