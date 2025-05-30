struct ManyBools {
  b01: Bool;
  b02: Bool;
  b03: Bool;
  b04: Bool;
  b05: Bool;
  b06: Bool;
  b07: Bool;
  b08: Bool;
  b09: Bool;
  b10: Bool;
  b11: Bool;
  b12: Bool;
  b13: Bool;
  b14: Bool;
  b15: Bool;
  b16: Bool;
  b17: Bool;
  b18: Bool;
  b19: Bool;
  b20: Bool;
  b21: Bool;
  b22: Bool;
  b23: Bool;
  b24: Bool;
  b25: Bool;
  b26: Bool;
  b27: Bool;
  b28: Bool;
  b29: Bool;
  b30: Bool;
  b31: Bool;
  b32: Bool;
  b33: Bool;
  b34: Bool;
  b35: Bool;
  b36: Bool;
  b37: Bool;
  b38: Bool;
  b39: Bool;
  b40: Bool;
  b41: Bool;
  b42: Bool;
  b43: Bool;
  b44: Bool;
  b45: Bool;
  b46: Bool;
  b47: Bool;
  b48: Bool;
  b49: Bool;
  b50: Bool;
  b51: Bool;
  b52: Bool;
  b53: Bool;
  b54: Bool;
  b55: Bool;
  b56: Bool;
  b57: Bool;
  b58: Bool;
  b59: Bool;
  b60: Bool;
  b61: Bool;
  b62: Bool;
  b63: Bool;
  b64: Bool;
  b65: Bool;
  b66: Bool;
  b67: Bool;
  b68: Bool;
  b69: Bool;
  b70: Bool;
  b71: Bool;
  b72: Bool;
  b73: Bool;
  b74: Bool;
  b75: Bool;
  b76: Bool;
  b77: Bool;
  b78: Bool;
  b79: Bool;
  b80: Bool;
  b81: Bool;
  b82: Bool;
  b83: Bool;
  b84: Bool;
  b85: Bool;
  b86: Bool;
  b87: Bool;
  b88: Bool;
  b89: Bool;
  b90: Bool;
  b91: Bool;
  b92: Bool;
  b93: Bool;
  b94: Bool;
  b95: Bool;
  b96: Bool;
  b97: Bool;
  b98: Bool;
  b99: Bool;
  b100: Bool;
}

contract FatBits {
    f: ManyBools;
    init() {
        self.f = ManyBools{
            b01:true,  b02:false, b03:true,  b04:false, b05:true,
            b06:false, b07:true,  b08:false, b09:true,  b10:false,
            b11:true,  b12:false, b13:true,  b14:false, b15:true,
            b16:false, b17:true,  b18:false, b19:true,  b20:false,
            b21:true,  b22:false, b23:true,  b24:false, b25:true,
            b26:false, b27:true,  b28:false, b29:true,  b30:false,
            b31:true,  b32:false, b33:true,  b34:false, b35:true,
            b36:false, b37:true,  b38:false, b39:true,  b40:false,
            b41:true,  b42:false, b43:true,  b44:false, b45:true,
            b46:false, b47:true,  b48:false, b49:true,  b50:false,
            b51:true,  b52:false, b53:true,  b54:false, b55:true,
            b56:false, b57:true,  b58:false, b59:true,  b60:false,
            b61:true,  b62:false, b63:true,  b64:false, b65:true,
            b66:false, b67:true,  b68:false, b69:true,  b70:false,
            b71:true,  b72:false, b73:true,  b74:false, b75:true,
            b76:false, b77:true,  b78:false, b79:true,  b80:false,
            b81:true,  b82:false, b83:true,  b84:false, b85:true,
            b86:false, b87:true,  b88:false, b89:true,  b90:false,
            b91:true,  b92:false, b93:true,  b94:false, b95:true,
            b96:false, b97:true,  b98:false, b99:true,  b100:false
        };
    }
    receive() {}
}