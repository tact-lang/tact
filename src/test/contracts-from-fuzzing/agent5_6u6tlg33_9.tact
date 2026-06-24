extends fun greet(self: ContractExtensionTest): String {
    return "Hello from extension";
}

contract ContractExtensionTest() {
    receive() {
         let s = self.greet();
         message(MessageParameters{
              to: sender(),
              value: 0,
              mode: SendRemainingValue,
              body: s.asComment(),
         });
    }
}
