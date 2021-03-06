package com.tob.tutorbook.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    @Size(max = 50)
    private String name;

    @Column(name = "email")
    @Size(max = 50)
    @NotBlank
    private String email;

    @Column(name = "password")
    @Size(max = 100)
    @NotBlank
    private String password;

    @Column(name = "phone")
    @Size(max = 15)
    private String phone;

    @ManyToMany
    @JoinTable(name = "user_has_role",
    joinColumns = @JoinColumn(name = "user_id"),
    inverseJoinColumns = @JoinColumn(name = "role_id"))
    @NotEmpty
    private Set<@NotNull Role> roles;

    public User() {
    }

    public User(@Size(max = 50) String name,
                @Size(max = 50) @NotBlank String email,
                @Size(max = 100) @NotBlank String password,
                @Size(max = 15) String phone,
                @NotEmpty Set<@NotNull Role> roles) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
