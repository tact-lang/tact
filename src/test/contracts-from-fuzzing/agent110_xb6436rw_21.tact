message MyMsg { 
    value: Int; 
}

contract TestBouncedTyped {
    bounced(msg: bounced<MyMsg>) {
         // Bounced receiver with typed bounced message
    }
}
