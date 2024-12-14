primitive Int;

trait BaseTrait {
    
}

contract Main {
    m1: map<Int, Int as varuint16>;
    m2: map<Int, Int as varuint32>;

    get fun test1(): Int {
        let m1: map<Int, Int as varuint16> = emptyMap();
        m1.set(1, 2);
        self.m1.set(1, 2);
        return m1.get(1) + self.m1.get(1);
    }

    get fun test2(): Int {
        let m2: map<Int, Int as varuint32> = emptyMap();
        m2.set(1, 2);
        self.m2.set(1, 2);
        return m2.get(1) + self.m2.get(1);
    }
}
