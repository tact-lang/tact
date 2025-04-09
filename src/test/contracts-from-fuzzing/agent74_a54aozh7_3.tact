contract TestIf {
    receive() {
        // Simple if
        if (true) { dump(1); }
        
        // if-else
        if (false) { dump(2); } else { dump(3); }
        
        // if-else-if chain
        if (false) { dump(4); } else if (true) { dump(5); } else { dump(6); }
    }
}
