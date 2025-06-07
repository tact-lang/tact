struct DeepLeaf {
    foo: Int;
    bar: Bool;
}

struct MaybeLeaf {
    child: DeepLeaf?;
}

struct MaybeMid {
    maybeLeaf: MaybeLeaf?;
}

struct MaybeOuter {
    maybeMid: MaybeMid?;
}

contract OptionalContainers {
    root: MaybeOuter?;

    init() {
        self.root = MaybeOuter{
            maybeMid: MaybeMid{
                maybeLeaf: MaybeLeaf{
                    child: DeepLeaf{ foo: 42, bar: true }
                }
            }
        };
    }
}