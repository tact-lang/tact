struct InnerGroup {
    a:Int;
    b:Int?;
}

struct GroupContainer {
    g1: InnerGroup;
    g2: InnerGroup;
}

contract GroupsTest {
    val: GroupContainer;
    init() {
        self.val = GroupContainer{
            g1: InnerGroup{a:1,b:null},
            g2: InnerGroup{a:2,b:null}
        };
    }
}