import path = require("path");
import { vi } from "vitest";

vi.spyOn(process, "cwd").mockReturnValue(path.resolve(__dirname));
