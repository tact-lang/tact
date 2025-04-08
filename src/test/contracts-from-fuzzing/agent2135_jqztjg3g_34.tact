struct SinglyNested {
    v: Int;
}

struct DoublyNested {
    sn: SinglyNested;
}

contract ManyLayersOptional {
    val: DoublyNested?;

    init() {
        self.val = DoublyNested{sn:SinglyNested{v:42}};
    }
}