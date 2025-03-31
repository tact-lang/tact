message Msg { value: Int; }

contract B {
    receive("fail") {
        require(false, "Intentional failure to trigger bounce");
    }
}

contract A {
    bounced(msg: bounced<Msg>) {
        // Handle bounced message
    }

    fun sendFail(to: Address) {
        // Forward a message with bounce flag set; this message is expected to bounce
        self.forward(to, "trigger".asComment(), true, null);
    }
}
