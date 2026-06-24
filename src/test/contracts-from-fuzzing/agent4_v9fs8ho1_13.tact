// Fuzz Testing Report for Bounced Messages and Bounce Receiver Functionality in Tact Contracts

/*
Overview:
---------
This fuzz-testing cycle focused on validating the behavior of bounced messages and bounce receivers as specified in the Tact documentation. Specifically, we verified that the bounce receiver functionality (defined in contracts) adheres to the documented syntax and semantics, as described e.g. in the 'Bounced messages' section (citeturn0file0) and in the receiver functions documentation (citeturn0file3).

Test Cases:
-----------
1. Standard Bounce Receiver (Typed):
   • A bounce receiver declared with a parameter wrapped as bounced<T> (e.g. bounced(msg: bounced<MyMessage>)) was implemented and compiled successfully.

      Example:
      --------------------------------------
      message MyMessage {
          value: Int;
      }

      contract TestBounce {
          bounced(msg: bounced<MyMessage>) {
              // Proper bounce receiver
          }
      }
      --------------------------------------

2. Bounce Receiver with a Raw Slice:
   • A bounce receiver that directly accepts a raw Slice (declared as bounced(rawMsg: Slice)) also compiled without error, as allowed by the documentation.

      Example:
      --------------------------------------
      contract TestBounceRaw {
          bounced(rawMsg: Slice) {
              // Bounce processing using raw message slice
          }
      }
      --------------------------------------

3. Incorrect Bounce Receiver Declaration:
   • A bounce receiver defined without wrapping its parameter in bounced<T> (e.g., bounced(msg: MyMessage)) was correctly rejected by the compiler, generating a compile-time error. This is in line with the documented requirement to wrap bounce message types to form bounced<…>.

      Example:
      --------------------------------------
      contract IncorrectBounce2 {
          bounced(msg: MyMessage) {
              // This definition should cause a compilation error
          }
      }
      --------------------------------------

4. Recursive Bounce Simulation:
   • A contract (RecursiveBounce) was implemented to simulate recursive bounce handling. In this test, the bounced receiver sends a new bounce message back to its own address. A counter ensures that recursion only occurs up to three times (i.e. to avoid infinite loops).

      Example:
      --------------------------------------
      contract RecursiveBounce {
          myAddr: Address;
          counter: Int = 0;

          init(myAddr_: Address) {
              self.myAddr = myAddr_;
          }
          
          // Force bounce by failing in receive()
          receive() {
              require(false, "fail");
          }

          bounced(msg: bounced<MyMessage>) {
              self.counter += 1;
              if (self.counter < 3) {
                  send(SendParameters{
                      to: self.myAddr,
                      value: 0,
                      bounce: true,
                      mode: SendRemainingValue,
                      body: MyMessage{ value: self.counter }.toCell()
                  });
              }
          }
      }
      --------------------------------------

5. Address Literal Handling in Bounce Send:
   • An initial test using an invalid address literal (such as 0:0) resulted in a failure during constant evaluation. Replacing it with a properly formatted dummy address (using a 64 hex-digit pattern) allowed the send operation to compile. This confirms that the compiler enforces strict constant evaluation for address literals.

      Example (corrected):
      --------------------------------------
      contract A {
          bounced(msg: bounced<MyMessage>) {
              // Bounce receiver logic
          }

          receive() {
              send(SendParameters{
                  to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
                  value: 10,
                  bounce: true,
                  mode: 0,
                  body: MyMessage{ value: 99 }.toCell()
              });
          }
      }
      --------------------------------------

Conclusion:
-----------
Our fuzz testing confirmed that:
   • Bounce receivers must be defined with their types wrapped in bounced<T> (or as raw Slice), exactly as documented.
   • The compiler correctly produces error messages when a bounce receiver is mis-declared.
   • Recursive bounce handling is supported, provided developers implement their own safeguards.
   • Constant evaluation of address literals is performed strictly.

All observed behaviors are consistent with the official Tact documentation; no discrepancies or compiler bugs were detected in this cycle.

References:
-----------
   - Bounced messages documentation: citeturn0file0
   - Receiver functions and bounce receiver details: citeturn0file3

End of Fuzz Testing Cycle Report.
*/