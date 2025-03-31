message GeneratedOpcode {}
message(0x12345678) ManuallySpecifiedOpcode {}

contract MessageTest {
    // Receiver for GeneratedOpcode messages
    receive(a: GeneratedOpcode) { dump(1); }

    // Receiver for ManuallySpecifiedOpcode messages
    receive(b: ManuallySpecifiedOpcode) { dump(2); }

    // Fallback receiver
    receive() { dump(0); }
}
