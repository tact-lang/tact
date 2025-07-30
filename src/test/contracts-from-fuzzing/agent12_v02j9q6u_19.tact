struct Data {
    value: Int;
}

contract TestMapStruct {
    m: map<Int, Data> = emptyMap();

    receive() {
        // Set a struct value
        self.m.set(1, Data { value: 999 });

        // Get and check the struct using non-null assertion
        let got: Data? = self.m.get(1);
        if (got != null) {
            dump(got!!.value); // Expected output: 999
        } else {
            dump(-1);
        }

        // Replace the struct value and get the old one
        let old: Data? = self.m.replaceGet(1, Data { value: 111 });
        if (old != null) {
            dump(old!!.value); // Expected output: 999
        } else {
            dump(-2);
        }

        // Check the new value
        let cur: Data? = self.m.get(1);
        if (cur != null) {
            dump(cur!!.value); // Expected output: 111
        } else {
            dump(-3);
        }
    }
}
