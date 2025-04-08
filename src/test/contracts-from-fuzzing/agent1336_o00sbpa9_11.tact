struct ManyBools {
    a: Bool; b: Bool; c: Bool; d: Bool; e: Bool;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
}

contract ManyBoolsContract {
    data: ManyBools;

    init() {
        self.data = ManyBools{
            a:true, b:false, c:true, d:false, e:true,
            f:false, g:true, h:false, i:true, j:false
        };
    }

    receive() {
        let _ = self.data;
    }
}