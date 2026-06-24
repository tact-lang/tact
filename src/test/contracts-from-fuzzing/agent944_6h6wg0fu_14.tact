struct MultipleOptionals {
    flag1: Bool?;
    flag2: Bool?;
    flag3: Bool?;
    num: Int;
}

contract MultiOptTest {
    m: MultipleOptionals;

    init() {
        self.m = MultipleOptionals{
            flag1: null, flag2:true, flag3:null, num: 7
        };
    }
}