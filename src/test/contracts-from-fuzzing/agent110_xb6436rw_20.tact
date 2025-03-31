/*
Test 20: TestReceiverTrait
A trait with a receiver function, then used in a contract.
*/

trait TestReceiverTrait {
    receive("trait") {
         // Trait receiver, intended for messages with text "trait"
    }
}

contract TestUsingTrait with TestReceiverTrait {
    receive() { 
         // Default empty receiver
         cashback(sender());
    }
}
