struct InnerMost { i: Int }

struct InnerMid { m: InnerMost }

struct InnerTop { t: InnerMid }

struct OuterMost { top: InnerTop }

contract VeryDeeplyNestedPersistent {
    deeply: OuterMost;

    init() {
        self.deeply = OuterMost{top:InnerTop{t:InnerMid{m:InnerMost{i:123}}}};
    }
}