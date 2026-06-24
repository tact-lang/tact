struct SubLeaf { flag: Bool }

struct MiddleLayer { leaf: SubLeaf }

struct TopContainer { middle: MiddleLayer }

contract OptOuterNonOptInner {
    field: TopContainer?;
    init() {
        self.field = TopContainer{
            middle: MiddleLayer{ leaf: SubLeaf{ flag: true } }
        };
    }
}