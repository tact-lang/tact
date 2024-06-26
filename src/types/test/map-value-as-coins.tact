primitive Int;

trait BaseTrait {
    
}

contract Main {
    m: map<Int, Int as coins>;

    get fun test(): Int {
        let m: map<Int, Int as coins> = emptyMap();
        m.set(1, 2);
        self.m.set(1, 2);
        return m.get(1) + self.m.get(1);
    }
}