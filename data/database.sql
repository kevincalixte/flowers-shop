CREATE TABLE tasks (
                       id INT AUTO_INCREMENT PRIMARY KEY,

                       title VARCHAR(255) NOT NULL,

                       category ENUM('magasin','administratif','produit') NOT NULL,
                       status   ENUM('a_faire','en_cours','a_reassigner','termine') NOT NULL DEFAULT 'a_faire',
                       priority ENUM('faible','moyenne','elevee') NOT NULL DEFAULT 'moyenne',

                       assigned_to INT NULL,

                       created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       validated_at DATETIME NULL
);

CREATE TABLE users (
                       id INTEGER PRIMARY KEY AUTOINCREMENT,
                       first_name VARCHAR(50) NOT NULL,
                       last_name VARCHAR(50) NOT NULL,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       phone VARCHAR(20),
                       password VARCHAR(255) NOT NULL,
                       role VARCHAR(30) NOT NULL,
                       status VARCHAR(20) DEFAULT 'active',
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (first_name, last_name, email, phone, password, role, status)
VALUES
    ('Sophie', 'Martin', 'sophie.martin@example.com', '0600000001', '$2b$10$7QJ8Qw1Qw1Qw1Qw1Qw1QwO1Qw1Qw1Qw1Qw1Qw1Qw1Qw1Qw1Qw1Qw', 'vendeur', 'active'),
    ('Julie', 'Durand', 'julie.durand@example.com', '0600000002', '$2b$10$8Rk9Rk2Rk2Rk2Rk2Rk2RkO2Rk2Rk2Rk2Rk2Rk2Rk2Rk2Rk2Rk2Rk', 'vendeur', 'active'),
    ('Claire', 'Lefevre', 'claire.lefevre@example.com', '0600000003', '$2b$10$9Sl0Sl3Sl3Sl3Sl3Sl3SlO3Sl3Sl3Sl3Sl3Sl3Sl3Sl3Sl3Sl3Sl', 'vendeur', 'active'),
    ('Lucas', 'Bernard', 'lucas.bernard@example.com', '0600000004', '$2b$10$0Tm1Tm4Tm4Tm4Tm4Tm4TmO4Tm4Tm4Tm4Tm4Tm4Tm4Tm4Tm4Tm4Tm', 'vendeur', 'active'),
    ('Emma', 'Petit', 'emma.petit@example.com', '0600000005', '$2b$10$1Un2Un5Un5Un5Un5Un5UnO5Un5Un5Un5Un5Un5Un5Un5Un5Un5Un', 'stagiaire', 'active'),
    ('Paul', 'Dubois', 'paul.dubois@example.com', '0600000006', '$2b$10$2Vo3Vo6Vo6Vo6Vo6Vo6VoO6Vo6Vo6Vo6Vo6Vo6Vo6Vo6Vo6Vo6Vo', 'responsable', 'active');
CREATE TABLE comments (
                          id_comment INT AUTO_INCREMENT PRIMARY KEY,

                          task_id INT NOT NULL,
                          employe_id INT NOT NULL,

                          content TEXT NOT NULL,

                          created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- relations
                          CONSTRAINT fk_comment_task
                              FOREIGN KEY (task_id)
                                  REFERENCES tasks(id_task)
                                  ON DELETE CASCADE,

                          CONSTRAINT fk_comment_employe
                              FOREIGN KEY (employe_id)
                                  REFERENCES employes(id_employe)
                                  ON DELETE CASCADE
);