contract ManyOptionals {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
    o4: Address? = null;
    o5: Int? = null;
    o6: Bool? = null;
    receive() {
        let _ = self.o5;
    }
}